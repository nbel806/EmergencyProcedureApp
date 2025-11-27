package nz.auckland.emergencyprocedures

data class TocItem(
    val title: String,
    val pageIndex: Int  // 0-based page index in the PDF
)
