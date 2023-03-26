
namespace MyFlixApp {
    use Android.Context
    use Android.View
    use Android.Component
    use Android.column
    use Android.textView
    use Android.toast
    use Android.button

    @Test
    def textViewExample(
        context: Context
    ): View \ { IO } = Component.init(context, 
        column(
            textView("Hello from flix!") ::
            button("Click me!", _ -> toast(context, "Clicked!")) ::
            Nil
        )
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