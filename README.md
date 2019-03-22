# weasel-program
D implementation of Richard Dawkin's weasel program.

## Usage

```console
$ git clone https://github.com/kotet/weasel-program.git
$ cd weasel-program/
$ dub run -q
Number of offspring per generation: 1000
Mutation rate: 0.090000
Target:   "METHINKS IT IS LIKE A WEASEL" (28 characters)
Gen 0000: "BQZTMLHTHYEDLFQAOITXXILNATPK" (score: 1)
Gen 0001: "BQZTMLHTHYEDLS AOITXXILYATPK" (score: 3)
Gen 0002: "BQZTMLHTHBTDLS AOITXXILNATZK" (score: 4)
Gen 0003: "BQZTMLHSH TDLS AIITXXILNATZK" (score: 6)
Gen 0004: "BQZTILHSH TDLS AIKVXXILNATZK" (score: 8)
Gen 0005: "BLZTINASH TDLS AIKVXXILNATEK" (score: 10)
Gen 0006: "BSWTINASH TDLS AIKEXXILNATEK" (score: 11)
Gen 0007: "BEWTINASH TDLS AIKENXIWNATEK" (score: 13)
Gen 0008: "BEWTINASH T LS AIKENXIWNATEK" (score: 14)
Gen 0009: "BEWTINAS  T LS AIKEXX WQATEK" (score: 16)
Gen 0010: "BEWTINAS RT LS AIKEXX WEATEK" (score: 17)
Gen 0011: "BEWTINAS RT LS AIKE X WEATEK" (score: 18)
Gen 0012: "BEWTINAS RT LS AIKE X WEATEL" (score: 19)
Gen 0013: "BETTINAS RT LS AIKE X WEATEL" (score: 20)
Gen 0014: "BETPINKS RT LS AIKE X WEATEL" (score: 21)
Gen 0015: "METPINKS RT LS AIKE X WEAJEL" (score: 22)
Gen 0016: "METPINKS OT XS AIKE X WEAJEL" (score: 22)
Gen 0017: "METPINKS OT IS AIKE X WEAJEL" (score: 23)
Gen 0018: "METHINKS OT IS VIKE X WEAJEL" (score: 24)
Gen 0019: "METHINKS IT IS VIKE X WEAJEL" (score: 25)
Gen 0020: "METHINKS IT IS VIKE X WEAJEL" (score: 25)
Gen 0021: "METHINKS IT IS VIKE A WEAJEL" (score: 26)
Gen 0022: "METHINKS IT IS VIKE A WEAJEL" (score: 26)
Gen 0023: "METHINKS IT IS VIKE A WEAJEL" (score: 26)
Gen 0024: "METHINKS IT IS VIKE A WEAJEL" (score: 26)
Gen 0025: "METHINKS IT IS JIKE A WEAHEL" (score: 26)
Gen 0026: "METHINKS IT IS LIKE A WEAHEL" (score: 27)
Gen 0027: "METHINKS IT IS LIKE A WEASEL" (score: 28)
```

## Options

```console
$ dub run -q -- --help
D implementation of Richard Dawkin's weasel program.
-t         --target Target string.
-n --offsprings_num Number of offspring per generation.
-r  --mutation_rate Mutation rate: probability that any given letter will change.
-h           --help This help information.
```
