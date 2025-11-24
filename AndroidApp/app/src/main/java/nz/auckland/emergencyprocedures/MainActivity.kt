package nz.auckland.emergencyprocedures

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.github.barteksc.pdfviewer.PDFView

class MainActivity : AppCompatActivity() {

    private lateinit var pdfView: PDFView
    private lateinit var tocRecyclerView: RecyclerView

    private val pdfFileName = "emergency_procedures.pdf"

    private val tocItems = listOf(
        TocItem("Introduction", 0),
        TocItem("Safety Procedures", 3),
        TocItem("Fire Evacuation", 7),
        TocItem("Earthquake Response", 12),
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_pdf_toc)

        pdfView = findViewById(R.id.pdfView)
        tocRecyclerView = findViewById(R.id.tocRecyclerView)

        // Init TOC
        tocRecyclerView.layoutManager = LinearLayoutManager(this)
        tocRecyclerView.adapter = TocAdapter(tocItems) { item ->
            // Jump to page when a TOC item is tapped
            pdfView.jumpTo(item.pageIndex, true)
        }

        // Load PDF (from assets)
        loadPdf()
    }

    private fun loadPdf() {
        // Put the file in app/src/main/assets/emergency_procedures.pdf
        pdfView.fromAsset(pdfFileName)
            .defaultPage(0)
            .enableSwipe(true)
            .swipeHorizontal(false)
            .enableDoubletap(true)
            .load()
    }
}
