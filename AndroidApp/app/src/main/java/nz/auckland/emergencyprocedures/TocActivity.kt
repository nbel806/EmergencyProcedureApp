package nz.auckland.emergencyprocedures

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView

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

        val recycler = findViewById<RecyclerView>(R.id.tocRecyclerView)
        recycler.layoutManager = LinearLayoutManager(this)

        recycler.adapter = TocAdapter(tocItems) { item ->
            // Open PDF screen and pass (pageIndex)
            val intent = Intent(this, PdfActivity::class.java)
            intent.putExtra("pageIndex", item.pageIndex)
            startActivity(intent)
        }
    }
}
