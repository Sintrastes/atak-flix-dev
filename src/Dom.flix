
enum DOM with ToString {
    case Text(String),
    case Checkbox(Bool),
    case EditText(String),
    case Row(
        List[DOM]
    ),
    case Column(
        List[DOM]
    )
}