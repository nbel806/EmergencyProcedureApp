package nz.auckland.emergencyprocedures

import TocAdapter
import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import androidx.appcompat.widget.Toolbar


class TocActivity : AppCompatActivity() {

    private val tocItems = listOf(
        TocItem("Introduction", 0),
        TocItem("Safety Procedures", 3),
        TocItem("Fire Evacuation", 7),
        TocItem("Earthquake Response", 12)
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_toc)

        val toolbar = findViewById<Toolbar>(R.id.topAppBar)
        setSupportActionBar(toolbar)

        val recycler = findViewById<RecyclerView>(R.id.tocRecyclerView)
        recycler.layoutManager = LinearLayoutManager(this)
        recycler.adapter = TocAdapter(tocItems) { item ->
            val intent = Intent(this, PdfActivity::class.java)
            intent.putExtra("pageIndex", item.pageIndex)
            startActivity(intent)
        }
    }
}

