## Compare Maximally Generative Letter Tiles Approaches

Supporting code for [this blog post](https://alangrow.com/blog/maximally-generative-letter-tiles). All you need is `python3` and `make`. To run the approaches and compare results:

```sh
make
```

To experiment with a different tileset size (default is 20):

```sh
make -B NTILES=10
```

To use a different dictionary (default is `/usr/share/dict/words`):

```sh
make -B DICT=/usr/share/dict/british-english
```

To see the actual wordlist formed by an approach's optimal tileset:

```sh
cat subtractive/results2
```
