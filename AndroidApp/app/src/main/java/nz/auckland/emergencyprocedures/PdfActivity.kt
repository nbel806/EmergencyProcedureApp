package nz.auckland.emergencyprocedures

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.Toolbar
import com.github.barteksc.pdfviewer.PDFView

class PdfActivity : AppCompatActivity() {

    private lateinit var pdfView: PDFView
    private val pdfFileName = "emergency_procedures.pdf"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_pdf)

        val toolbar = findViewById<Toolbar>(R.id.pdfTopAppBar)
        setSupportActionBar(toolbar)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)

        pdfView = findViewById(R.id.pdfView)

        val pageIndex = intent.getIntExtra("pageIndex", 0)

        pdfView.fromAsset(pdfFileName)
            .defaultPage(pageIndex)
            .enableSwipe(true)
            .enableDoubletap(true)
            .load()
    }

    override fun onSupportNavigateUp(): Boolean {
        onBackPressedDispatcher.onBackPressed()
        return true
    }
}

