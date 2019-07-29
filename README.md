# Feature Flag Framework

Feature Toggles also referred as Feature Flags, Feature Bits, or Feature Flippers. Is a technique that allows teams to modify system behavior without changing code.

## How to use it ?

### Feature Flag Manager Custom Settings

For each new feature flag needed you must create a new field inside the Custom Settings called "Feature Flag Manager", usually it has a checkbox (true/false) field data type.

### Feature Flag Manager Utilities Class

Once you have the new custom settings field you must add two new methods inside the class "FeatureFlagManagerUtilities". The first method should be a check if the feature flag is enabled and the other one should be a toggle to enable/disabled the feature flag dynamically for tests purposes.

### Case Trigger

At Case Trigger we have a sample how to use the feature flag inside an apex code.