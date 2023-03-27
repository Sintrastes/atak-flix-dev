
namespace Android {
    pub type alias Context = ##android.content.Context
    pub type alias AttributeSet = ##android.util.AttributeSet
    pub type alias View = ##android.view.View
    pub type alias ViewGroup = ##android.view.ViewGroup
    pub type alias TextView = ##android.widget.TextView
    pub type alias Button = ##android.widget.Button
    pub type alias LinearLayout = ##android.widget.LinearLayout
    pub type alias OnClickListener = ##android.view.View$OnClickListener

    pub enum Component(Context -> View & IO)

    pub eff Layout {
        pub def addComponent(value: Component): Unit
    }

    namespace Component {
        use Android.View 
        use Android.Context

        pub def init(context: Android.Context, component: Component): View \ IO = {
            match component {
                case Android.Component.Component(builder) =>
                    builder(context)
            }
        }

        pub def getView(context: Context, component: Component): View \ IO = match component {
            case Android.Component.Component(builder) => builder(context)
        }
    }

    pub def textView(rh: Region[r], contents: Dynamic[r, IO, String]): Component = {
        import new android.widget.TextView(Context): ##android.widget.TextView \ IO as newTextView;
        import android.widget.TextView.setText(##java.lang.CharSequence): Unit \ IO as setText;
        Android.Component.Component(ctx ->
            let view = newTextView(ctx);

            contents |> Dynamic.onUpdate(rh, text ->
                setText(view, checked_cast(text))
            );

            checked_cast(view)
        )
    }

    pub def button(text: String, onClick: Unit -> Unit \ IO): Component = {
        import new android.widget.Button(Context): ##android.widget.Button \ IO as newButton;
        import android.widget.Button.setText(##java.lang.CharSequence): Unit \ IO as setText;
        import android.view.View.setOnClickListener(OnClickListener): Unit \ IO as setOnClickListener;

        Android.Component.Component(ctx ->
            let view = newButton(ctx);
            setText(view, checked_cast(text));
            setOnClickListener(checked_cast(view), new OnClickListener {
                def onClick(_: OnClickListener, _: View): Unit \ IO = onClick()
            });
            checked_cast(view)
        )
    }

    pub def row(children: List[Component]): Component = {
        import new android.widget.LinearLayout(Context): LinearLayout \ IO as newLinearLayout;
        import android.widget.LinearLayout.addView(View): Unit \ IO as addView;

        Android.Component.Component(ctx -> 
            let layout = newLinearLayout(ctx);

            foreach(child <- children)
                addView(layout, Component.getView(ctx, child));

            checked_cast(layout)
        )
    }

    pub def column(children: List[Component]): Component = {
        import new android.widget.LinearLayout(Context): LinearLayout \ IO as newLinearLayout;
        import android.widget.LinearLayout.setOrientation(Int32): Unit \ IO as setOrientation;
        import android.widget.LinearLayout.addView(View): Unit \ IO as addView;

        Android.Component.Component(ctx -> 
            let layout = newLinearLayout(ctx);
            setOrientation(layout, 1);

            foreach(child <- children)
                addView(layout, Component.getView(ctx, child));

            checked_cast(layout)
        )
    }

    pub def toast(context: Context, message: String): Unit \ IO = {
        import new android.widget.Toast(Context): ##android.widget.Toast \ IO as newToast;
        import android.widget.Toast.setText(##java.lang.CharSequence): Unit \ IO as setText;
        import android.widget.Toast.show(): Unit \ IO as show;

        let toast = newToast(context);
        setText(toast, checked_cast(message));
        show(toast)
    }
}
