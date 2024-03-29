# atak-flix-dev

[ATAK](https://github.com/deptofdefense/AndroidTacticalAssaultKit-CIV) is a geospatial mapping application allowing teams to communicate and share information in real-time.

[Flix](https://flix.dev/) is a modern programming language compiling to the JVM that offers many advantages over traditional languages used for Android development (such as Java and Kotlin).

In this repository, we try to put them together!

![hello_flix](https://user-images.githubusercontent.com/4064213/220252400-a24e61f1-7fd8-4da2-b1a9-d24fa7ad1121.png)

## Why?

[Kotlin](https://kotlinlang.org/) is great and all, and is a big improvement over Java, yet the language is still lacking in may ways: 

  * There is no way for the complier to enforce the _purity_ of functions, which is incredibly important for reasoning about your program and making it as testable as possible. 
    * The fact that the compiler can't enforce things like this makes it all-to-easy to make "spooky action at a distance" code when writing idiomatic Kotlin, where arbitrary parts of your codebase can be affected by arbitrary other parts. A pure function takes inputs, and produces outputs -- that's it! -- super easy to test, super easy to reason about.
  * Type inference in Kotlin is weak (result-based), which can make the ergonomics of very strongly-typed and generic-based APIs much more painful than they have to be, whereas Flix uses full hindley-milner type inference (albeit still requiring types for top-level definitions). 
  * Receivers in Kotlin are cool and all, but typeclasses are a whole other world, and not likely something we're going to get something similar to soon in Kotlin. The JavaGI paper was published over a decade ago -- [we know how to incorporate typeclasses in a standard object-oriented language](https://dl.acm.org/doi/10.1145/1985342.1985343) -- let's see it in a production language already! (Specifically one easy to use on Android)
  * Lack of type-classes in general can be pretty annoying, and in particular the "hack" of every object having implicit `.equals(other: Any?)`, and `.toString()` methods associated with them, even when that may or may not make sense is annoying as well.
  * Implicit casting to supertypes is nice for interop with Java and OO I guess, but it can really cramp a functional style. I'm looking at you `StateFlow<A> :< Flow<A>`.

As someone who does their day-to-day ATAK work in Kotlin... I wanted to experiment with a better way forward, and Flix (given it addresses these language deficienies and more, and complies to the JVM) seems like the best option to do that.

Scala was another option for this, but unfortounately it has poor (and effectively non-existent in the latest versions) support for Android due to the versions of the JDK it targets. Additionally, Scala also does not make it possible to track the purity of functions, and like Kotlin only has a result-based type inference mechanism. 

## Building

To build this project, you will need to set `flix.compiler` in your `local.properties` file to point to a built `jar` of the flix compiler. Additionally, you will need to place your project somewhere where the takdev plugin can find the `main.jar` required to access the ATAK API in your project. An easy way to do this is to clone the root directory of your project in `atak-civ/plugins/`, where `atak-civ` has been downloaded from the ATAK open source release.

## License

This project is built off of the [ATAK plugin template](https://github.com/deptofdefense/AndroidTacticalAssaultKit-CIV/tree/master/plugin-examples/plugintemplate), and as such, parts of the code-base derived from this (i.e. the Java/Kotlin portions) are licensed under similar terms to that project. The rest of the code-base is licensed under the Apache license.
