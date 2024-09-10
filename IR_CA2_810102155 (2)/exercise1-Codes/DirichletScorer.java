// BSD License (http://lemurproject.org/galago-license)
package org.lemurproject.galago.core.retrieval.iterator.scoring;

import org.lemurproject.galago.core.retrieval.RequiredParameters;
import org.lemurproject.galago.core.retrieval.RequiredStatistics;
import org.lemurproject.galago.core.retrieval.processing.ScoringContext;
import org.lemurproject.galago.core.retrieval.query.AnnotatedNode;
import org.lemurproject.galago.core.retrieval.query.NodeParameters;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * A Dirichlet smoothing node, applied over a raw term count node.
 *
 * @author trevor, irmarc
 */
@RequiredStatistics(statistics = {"nodeFrequency","collectionLength"})
@RequiredParameters(parameters = {"mu"})
public class DirichletScorer {

  double background;
  double mu;

  public DirichletScorer(NodeParameters parameters) throws IOException {

    mu = parameters.get("mu", 1500D);
    long collectionLength = parameters.getLong("collectionLength");
    long collectionFrequency = parameters.getLong("nodeFrequency");
    background = (collectionFrequency > 0)
            ? (double) collectionFrequency / (double) collectionLength
            : 0.5 / (double) collectionLength;
  }

  public double score(int count, int length) {
    double numerator = count + (mu * background);
    double denominator = length + mu;
    return Math.log(numerator / denominator);
  }

  public double score(int count, int length, double externalBk) {
    double numerator = count + (mu * externalBk);
    double denominator = length + mu;
    return Math.log(numerator / denominator);
  }

  public double getBackground() {
    return background;
  }

  public void setBackground(double bk) {
    background = bk;
  }

//  public AnnotatedNode getAnnotatedNode(ScoringContext c) throws IOException {
//    String type = "JMSmoothing";
//    String className = this.getClass().getSimpleName();
////    String parameters = np.toString();
////    long document = currentCandidate();
////    boolean atCandidate = hasMatch(c);
////    String returnValue = Double.toString(score(c));
////    List<AnnotatedNode> children = new ArrayList<AnnotatedNode>();
////    children.add(this.lengthsIterator.getAnnotatedNode(c));
////    children.add(this.countIterator.getAnnotatedNode(c));
//    String extraInfo = "idf=";
//    AnnotatedNode node = new AnnotatedNode();
////    node.type
////    return new AnnotatedNode(type, className, parameters, document, atCandidate, returnValue, extraInfo, children);
//  }
}
