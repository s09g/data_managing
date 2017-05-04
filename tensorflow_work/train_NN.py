from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import os
import urllib

import numpy as np
import tensorflow as tf

# Data sets
IRIS_TRAINING = "iris_training.csv"
IRIS_TRAINING_URL = "http://download.tensorflow.org/data/iris_training.csv"

IRIS_TEST = "iris_test.csv"
IRIS_TEST_URL = "http://download.tensorflow.org/data/iris_test.csv"

def main():
  # fetch data 
  if not os.path.exists(IRIS_TRAINING):
    raw = urllib.urlopen(IRIS_TRAINING_URL).read()
    with open(IRIS_TRAINING, "w") as f:
      f.write(raw)
  if not os.path.exists(IRIS_TEST):
    raw = urllib.urlopen(IRIS_TEST_URL).read()
    with open(IRIS_TEST, "w") as f:
      f.write(raw)

  # load data
  training_set = tf.contrib.learn.datasets.base.load_csv_with_header(
      filename=IRIS_TRAINING,
      target_dtype=np.int,
      features_dtype=np.float32)
  test_set = tf.contrib.learn.datasets.base.load_csv_with_header(
      filename=IRIS_TEST,
      target_dtype=np.int,
      features_dtype=np.float32)

  feature_columns = [tf.contrib.layers.real_valued_column("", dimension=4)]

  # build 3 layer DNN with 10, 20, 10 units respectively.
  # for activation_fn, can try tf.{sigmoid,tanh,nn.elu,nn.relu}
  mdir = "/tmp/iris"
  classifier = tf.contrib.learn.DNNClassifier(feature_columns=feature_columns,
                                              hidden_units=[10,20,10], 
                                              activation_fn=tf.nn.relu,
                                              n_classes=3,
                                              model_dir=mdir)
  # prep training inputs
  def get_train_inputs():
    x = tf.constant(training_set.data)
    y = tf.constant(training_set.target)
    return x, y

  # DO THE TRAINING!
  classifier.fit(input_fn=get_train_inputs, steps=80)

  # prep test inputs
  def get_test_inputs():
    x = tf.constant(test_set.data)
    y = tf.constant(test_set.target)
    return x, y

  # how good is the training?
  accuracy_score = classifier.evaluate(input_fn=get_test_inputs,
                                       steps=1)["accuracy"]
  print("\nAccuracy: {0:f}\n".format(accuracy_score))

  # classify new flower samples.
  def new_samples():
    return np.array(
      [[4.6, 3.2, 1.3, 0.2],
      [6.6, 3.2, 4.5, 1.5],
      [6.5, 3.0, 5.2, 1.9]], dtype=np.float32)

  predictions = list(classifier.predict(input_fn=new_samples))
  print("New inputs, output class predictions:")
  print(new_samples(),"\n",predictions)

main() # run!

