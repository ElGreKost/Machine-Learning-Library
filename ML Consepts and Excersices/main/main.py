from sklearn.tree import DecisionTreeClassifier
import matplotlib.pyplot as plt
from sklearn.tree import plot_tree
import pandas as pd

df = pd.read_csv('tree_data.csv')


# Assuming df is your DataFrame with the data
X = df[['x1', 'x2', 'x3', 'x4']]  # Features
y = df['y']  # Labels

# Initialize the DecisionTreeClassifier with entropy to simulate ID3
# clf = DecisionTreeClassifier(criterion='gini', max_depth=2)

# Fit the model
# clf.fit(X, y)


# Plot the tree
plt.figure(figsize=(12, 8))
plot_tree(clf, filled=True, feature_names=['x1', 'x2', 'x3', 'x4'], class_names=['Negative', 'Positive'])
plt.show()
