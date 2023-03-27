
namespace MyFlixApp {
    use Android.Context
    use Android.View
    use Android.Component
    use Android.column
    use Android.textView
    use Android.toast
    use Android.button
    use Android.ViewGroup

    @Test
    def textViewExample(
        viewGroup: ViewGroup,
        context: Context
    ): Unit \ { IO } = region r {
        import android.view.ViewGroup.addView(View): Unit \ IO as addView;

        // Silly example showing how Dynamic integration works.
        let text = Dynamic.sequence(r, 
            Nel.Nel("a", "b" :: "c" :: "d" :: "e" :: "f" :: "g" :: "h" :: "i" :: "j" :: "k" :: 
                "l" :: "m" :: "n" :: "o" :: "p" :: "q" :: "r" :: "s" :: "t" :: "u" :: "V" ::
                "w" :: "x" :: "y" :: "z" :: Nil),
            Time/Duration.fromSeconds(1)
        );

        let view: View = Component.init(context, 
            column(
                textView(r, text) ::
                button("Click me!", _ -> toast(context, "Clicked!")) ::
                Nil
            )
        );

        addView(viewGroup, view)
    }

    @Test
    def showDomExample(): String = ToString.toString(
        DOM.Column(
            DOM.Text("Hello") ::
            DOM.EditText("") ::
            Nil
        )
    )
}