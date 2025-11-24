package nz.auckland.emergencyprocedures

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.github.barteksc.pdfviewer.PDFView

class PdfActivity : AppCompatActivity() {

    private lateinit var pdfView: PDFView
    private val pdfFileName = "emergency_procedures.pdf"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_pdf)

        pdfView = findViewById(R.id.pdfView)

        // Page to jump to
        val pageIndex = intent.getIntExtra("pageIndex", 0)

        pdfView.fromAsset(pdfFileName)
            .defaultPage(pageIndex)
            .enableSwipe(true)
            .load()
    }
}
