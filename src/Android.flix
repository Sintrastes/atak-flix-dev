
namespace Android {
    pub type alias Context = ##android.content.Context
    pub type alias AttributeSet = ##android.util.AttributeSet
    pub type alias View = ##android.view.View
    pub type alias TextView = ##android.widget.TextView

    pub enum Component[v](Context -> v \ IO)

    namespace Component {
        pub def init(context: Android.Context, component: Component[a]): a \ IO = {
            match component {
                case Android.Component.Component(builder) =>
                    builder(context)
            }
        }
    }

    pub def textView(contents: String): Component[TextView] = {
        import new android.widget.TextView(Context): ##android.widget.TextView \ IO as newTextView;
        import android.widget.TextView.setText(##java.lang.CharSequence): Unit \ IO as setText;
        Android.Component.Component(ctx ->
            let view = newTextView(ctx);
            setText(view, checked_cast(contents));
            view
        )
    }
}