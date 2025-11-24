package nz.auckland.emergencyprocedures

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

class TocAdapter(
    private val items: List<TocItem>,
    private val onItemClick: (TocItem) -> Unit
) : RecyclerView.Adapter<TocAdapter.TocViewHolder>() {

    inner class TocViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        private val titleText: TextView = itemView.findViewById(R.id.tocTitle)

        fun bind(item: TocItem) {
            titleText.text = item.title
            itemView.setOnClickListener { onItemClick(item) }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): TocViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_toc, parent, false)
        return TocViewHolder(view)
    }

    override fun onBindViewHolder(holder: TocViewHolder, position: Int) {
        holder.bind(items[position])
    }

    override fun getItemCount(): Int = items.size
}
