package com.sharingeconomy;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.TextView;
import android.view.View.OnClickListener;

import java.util.ArrayList;

public class ListAdapter extends BaseAdapter
{

    LayoutInflater inflater = null;
    private ArrayList<ItemData> m_oData = null;
    private int nListcnt = 0;

    public ListAdapter(ArrayList<ItemData> _oData)
    {
        m_oData = _oData;
        nListcnt = m_oData.size();
    }

    @Override
    public int getCount()
    {
        Log.d("TAG", "getCount");
        return nListcnt;
    }

    @Override
    public Object getItem(int position)
    {
        return null;
}

    @Override
    public long getItemId(int position)
    {
        return 0;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent)
    {
        if (convertView == null)
        {
            final Context context = parent.getContext();
            if (inflater == null)
            {
                inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            }
            convertView = inflater.inflate(R.layout.news_listview, parent, false);
        }

        TextView textViewWriterID = (TextView) convertView.findViewById(R.id.textViewWriterID);
        TextView textViewTitle = (TextView) convertView.findViewById(R.id.textViewTitle);
        Button btnSelect = (Button) convertView.findViewById(R.id.btnSelect);

        textViewWriterID.setText(m_oData.get(position).strID);
        textViewTitle.setText(m_oData.get(position).strTitle);
        btnSelect.setOnClickListener(m_oData.get(position).onClickListener);

        convertView.setTag(""+position);
        return convertView;
    }
}
