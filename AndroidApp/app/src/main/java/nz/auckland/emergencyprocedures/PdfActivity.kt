package nz.auckland.emergencyprocedures

import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.Toolbar
import com.github.barteksc.pdfviewer.PDFView
import com.github.barteksc.pdfviewer.util.FitPolicy

class PdfActivity : AppCompatActivity() {

    private lateinit var pdfView: PDFView
    private lateinit var titleView: TextView

    private val pdfFileName = "emergency_procedures.pdf"   // in assets/

    // Map of section title -> starting page (0-based, same as your Android & iOS TOC)
    private val tocSections = listOf(
        "Cover Page" to 0,
        "Auckland Hospital Map" to 1,
        "Greenlane Clinical Center Map" to 2,
        "Initial Actions" to 4,
        "Fire & R.A.C.E" to 7,
        "Loss of Essential Services" to 9,
        "Threat to Personal Safety" to 11,
        "Hospital Evacuation" to 13,
        "Natural Hazards" to 15,
        "Bomb, Chemical Threat and Suspicious Objects" to 17,
        "Hazardous Materials" to 19,
        "Missing Patient" to 21,
        "Major Incident Event" to 23
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_pdf)

        val toolbar = findViewById<Toolbar>(R.id.pdfTopAppBar)
        setSupportActionBar(toolbar)
        supportActionBar?.setDisplayShowTitleEnabled(false)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)

        titleView = findViewById(R.id.toolbarTitle)
        pdfView = findViewById(R.id.pdfView)

        // Page we were asked to start on
        val startPage = intent.getIntExtra("pageIndex", 0)

        // Set initial title based on starting page
        updateTitleForPage(startPage)

        pdfView.fromAsset(pdfFileName)
            .defaultPage(startPage)
            .pageFitPolicy(FitPolicy.WIDTH)
            .swipeHorizontal(true)
            .pageSnap(true)
            .pageFling(true)
            .autoSpacing(true)
            .spacing(8)
            .enableDoubletap(true)
            .onPageChange { page, _ ->
                updateTitleForPage(page)
            }
            .load()
    }

    private fun updateTitleForPage(page: Int) {
        val title = tocSections.lastOrNull { (_, startPage) ->
            startPage <= page
        }?.first ?: "Emergency Procedures"

        titleView.text = title
    }

    override fun onSupportNavigateUp(): Boolean {
        onBackPressedDispatcher.onBackPressed()
        return true
    }
}
