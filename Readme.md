# Unstable simulation involving some X for some optimization flags

In this example, there is an unstable bug (unstable in the sense that most slight modifications of the source will correct it).

How to reproduce the bug:
```bash
bash run.sh
```

Examples of actions that correct the bug:
- Moving the `moveme` assignment 4 lines up.
- Assigning sig_a to 0 instead of `in_data[89]`, which is anyways always 0.
- Removing `in_data[61:60]` in the or-reduction whose value is assigned to `sig_c`.

Expected result:
```
Without -fno*
out_0: 0
With -fno*
out_0: 1
```

Actual result:
```
Without -fno*
out_0: 0
With -fno*
out_0: 1
```
