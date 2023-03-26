
namespace MyFlixApp {
    use Android.Context
    use Android.TextView
    use Android.Component

    @Test
    def textViewExample(
        context: Context
    ): TextView \ { IO } = Component.init(
        context, 
        Android.textView("Hello from flix!")
    )

    @Test
    def showDomExample(): String = ToString.toString(
        DOM.Column(
            DOM.Text("Hello") ::
            DOM.EditText("") ::
            Nil
        )
    )
}