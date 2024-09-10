// BSD License (http://lemurproject.org/galago-license)
package org.lemurproject.galago.core.retrieval.iterator.scoring;

import org.lemurproject.galago.core.retrieval.RequiredParameters;
import org.lemurproject.galago.core.retrieval.RequiredStatistics;
import org.lemurproject.galago.core.retrieval.iterator.CountIterator;
import org.lemurproject.galago.core.retrieval.iterator.DeltaScoringIterator;
import org.lemurproject.galago.core.retrieval.iterator.LengthsIterator;
import org.lemurproject.galago.core.retrieval.iterator.ScoringFunctionIterator;
import org.lemurproject.galago.core.retrieval.processing.ScoringContext;
import org.lemurproject.galago.core.retrieval.query.AnnotatedNode;
import org.lemurproject.galago.core.retrieval.query.NodeParameters;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * A ScoringIterator that makes use of the DirichletScorer function for
 * converting a count into a score.
 *
 * @author sjh
 */
@RequiredStatistics(statistics = {"collectionLength", "nodeFrequency", "maximumCount"})
@RequiredParameters(parameters = {"landa"})
public class JMSmoothing extends ScoringFunctionIterator
        implements DeltaScoringIterator {

    // delta
    private final double weight;
    private final double min; // min score
    private final double max; // max tf
    private final double weightedMin;
    private final double weightedMax;
    private final double weightedMaxDiff;
    // stats
    private final double landa;
    private final double background;

    public JMSmoothing(NodeParameters p, LengthsIterator ls, CountIterator it)
            throws IOException {
        super(p, ls, it);

        // stats
        landa = p.get("landa", 0.4);
        long collectionLength = p.getLong("collectionLength");
        long collectionFrequency = p.getLong("nodeFrequency");
        background = (collectionFrequency > 0)
                ? (double) collectionFrequency / (double) collectionLength
                : 0.5 / (double) collectionLength;

        // delta
        weight = p.get("w", 1.0);

        // the max score can be bounded where the maxtf is also the length of that document (a long document of just tf)
        max = jmScore(p.getLong("maximumCount"), p.getLong("maximumCount"));

        // the min score is an over estimate for when the iterator does NOT contain the term (document freq of zero)
        //   MAX-SCORE requires this to be over estimated, otherwise you will lose documents
        //   empirically average document length is a good number (even if its NOT an overestimate of min possible score)
        min = jmScore(0, 1);

        weightedMin = weight * min;
        weightedMax = weight * max;
        weightedMaxDiff = weightedMax - weightedMin;
    }

    @Override
    public double minimumScore() {
        return min;
    }

    @Override
    public double maximumScore() {
        return max;
    }

    @Override
    public double getWeight() {
        return weight;
    }

    @Override
    public double deltaScore(ScoringContext c) {
        return weight * (max - score(c));
    }

    @Override
    public double maximumWeightedScore() {
        return weightedMax;
    }

    @Override
    public double minimumWeightedScore() {
        return weightedMin;
    }

    @Override
    public double maximumDifference() {
        return weightedMaxDiff;
    }

    @Override
    public double score(ScoringContext c) {
        int count = ((CountIterator) iterator).count(c);
        int length = this.lengthsIterator.length(c);
        return jmScore(count, length);
    }

    private double jmScore(double count, double length) {
        double numerator = (1 - landa) * count + (landa * length * background);
        double denominator = length ;
        return Math.log(numerator) - Math.log(denominator);
    }

    @Override
    public AnnotatedNode getAnnotatedNode(ScoringContext c) throws IOException {
        String type = "JMSmoothing";
        String className = this.getClass().getSimpleName();
        String parameters = np.toString();
        long document = currentCandidate();
        boolean atCandidate = hasMatch(c);
        String returnValue = Double.toString(score(c));
        List<AnnotatedNode> children = new ArrayList<AnnotatedNode>();
        children.add(this.lengthsIterator.getAnnotatedNode(c));
        children.add(this.countIterator.getAnnotatedNode(c));
        String extraInfo = "idf=";
        return new AnnotatedNode(type, className, parameters, document, atCandidate, returnValue, extraInfo, children);
    }
}
