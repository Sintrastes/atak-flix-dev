# atak-flix-dev

[ATAK](https://github.com/deptofdefense/AndroidTacticalAssaultKit-CIV) is a geospatial mapping application allowing teams to communicate and share information in real-time.

[Flix](https://flix.dev/) is a modern programming language compiling to the JVM that offers many advantages over traditional languages used for Android development (Java, Kotlin).

In this repository, we try to put them together!

## Why?

[Kotlin](https://kotlinlang.org/) is great and all, and is a big improvement over Java, yet the language is still lacking in may ways. There is no way for the complier to enforce the _purity_ of functions, which is incredibly important for reasoning about your program and making it as testable as possible. Type inference is weak (result-based), and doesn't support the joy that the ML-style "Write it like it's a dynamically typed language (no annotations), but with full type safety!" can bring. Generics are annoying (thanks to Hindley-Milner, this can all be implicitly inferred in Flix :) ), and generic numeric code in general can be annoying due to the lack of type-classes. Lack of type-classes in general can be pretty annoying, and in particular the "Hack" of every object having implicit `.equals(other: Any?)`, and `.toString()` methods associated with them, even when that may or may not make sense is annoying as well.

As someone who does their day-to-day ATAK work in Kotlin... I wanted to experiment with a better way forward, and Flix (given it addresses these language deficienies and more, and complies to the JVM) seems like the best option to do that.

Scala was another option for this, but unfortounately it has poor (and effectively non-existant in the latest versions) support for Android due to the versions of the JDK it targets. Additionally, Scala also does not make it possible to track the purity of functions, and like Kotlin only has a result-based type inference mechanism. 

## License

This project is built off of the [ATAK plugin template](https://github.com/deptofdefense/AndroidTacticalAssaultKit-CIV/tree/master/plugin-examples/plugintemplate), and as such, parts of the code-base derived from this (i.e. the Java/Kotlin portions) are licensed under similar terms to that project. The rest of the code-base is licensed under the Apache license.