package nz.auckland.emergencyprocedures

import TocAdapter
import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.DividerItemDecoration


class TocActivity : AppCompatActivity() {

    private val tocItems = listOf(
        TocItem("Cover Page", 0),
        TocItem("Auckland Hospital Map", 1),
        TocItem("Greenlane Clinical Center Map", 2),
        TocItem("Initial Actions", 4),
        TocItem("Fire & R.A.C.E", 7),
        TocItem("Loss of Essential Services", 9),
        TocItem("Threat to Personal Safety", 11),
        TocItem("Hospital Evacuation", 13),
        TocItem("Natural Hazards", 15),
        TocItem("Bomb, Chemical Threat and Suspicious Objects", 17),
        TocItem("Hazardous Materials", 19),
        TocItem("Missing Patient", 21),
        TocItem("Major Incident Event", 23),
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_toc)

        val toolbar = findViewById<androidx.appcompat.widget.Toolbar>(R.id.tocTopAppBar)
        setSupportActionBar(toolbar)
        supportActionBar?.setDisplayShowTitleEnabled(false)

        val recycler = findViewById<RecyclerView>(R.id.tocRecyclerView)
        recycler.layoutManager = LinearLayoutManager(this)
        recycler.adapter = TocAdapter(tocItems) { item ->
            val intent = Intent(this, PdfActivity::class.java)
            intent.putExtra("pageIndex", item.pageIndex)
            intent.putExtra("sectionTitle", item.title)
            startActivity(intent)
        }


        val divider = DividerItemDecoration(this, DividerItemDecoration.VERTICAL)
        divider.setDrawable(resources.getDrawable(R.drawable.divider_line, theme))
        recycler.addItemDecoration(divider)
    }
}


