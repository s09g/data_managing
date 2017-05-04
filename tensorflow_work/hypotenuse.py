import tensorflow as tf

a = tf.constant([3, 10.5, 6.7])
b = tf.constant([4, 12.6, 8.4])

a_square = tf.tofloat(tf.square(a))
b_square = tf.tofloat(tf.square(b))

c = tf.sqrt(a_square + b_square)

session = tf.InteractiveSession()
result = session.run(c)
print result

