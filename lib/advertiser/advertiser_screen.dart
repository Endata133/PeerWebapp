import 'package:flutter/material.dart';

class AdvertiserScreen extends StatefulWidget {
  @override
  _AdvertiserScreenState createState() => _AdvertiserScreenState();
}

class _AdvertiserScreenState extends State<AdvertiserScreen> {
  // Dummy data for campaigns
  final List<Map<String, dynamic>> _campaigns = [
    {
      'name': 'Summer Sale Campaign',
      'clicks': 350,
      'impressions': 5000,
      'spend': 125.50,
      'status': 'Active',
    },
    {
      'name': 'Product Launch',
      'clicks': 210,
      'impressions': 3500,
      'spend': 89.99,
      'status': 'Paused',
    },
    {
      'name': 'Holiday Promo',
      'clicks': 125,
      'impressions': 1800,
      'spend': 45.00,
      'status': 'Active',
    },
  ];

  // Function to create a new campaign
  void _createNewCampaign() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('New campaign creation coming soon!')),
    );
  }

  // Function to handle pausing a campaign
  void _pauseCampaign(int index) {
    setState(() {
      _campaigns[index]['status'] = 'Paused';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Campaign "${_campaigns[index]['name']}" paused')),
    );
  }

  // Function to handle resuming a campaign
  void _resumeCampaign(int index) {
    setState(() {
      _campaigns[index]['status'] = 'Active';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Campaign "${_campaigns[index]['name']}" resumed')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advertiser'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Create New Campaign Button
            ElevatedButton.icon(
              icon: Icon(Icons.campaign),
              label: Text('Create New Campaign'),
              onPressed: _createNewCampaign,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),

            SizedBox(height: 20),

            // Performance Overview Section
            Text(
              'Campaign Performance Overview',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            // Performance Metrics
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMetricCard('Total Clicks', _getTotalClicks().toString(), Colors.green),
                _buildMetricCard('Total Impressions', _getTotalImpressions().toString(), Colors.blue),
                _buildMetricCard('Total Spend', '\$${_getTotalSpend().toStringAsFixed(2)}', Colors.orange),
              ],
            ),

            SizedBox(height: 20),

            // Active Campaigns Section
            Expanded(
              child: ListView.builder(
                itemCount: _campaigns.length,
                itemBuilder: (context, index) {
                  return _buildCampaignCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build the campaign card
  Widget _buildCampaignCard(int index) {
    final campaign = _campaigns[index];
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campaign Name
            Text(
              campaign['name'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Campaign Metrics
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Clicks: ${campaign['clicks']}'),
                Text('Impressions: ${campaign['impressions']}'),
                Text('Spend: \$${campaign['spend'].toStringAsFixed(2)}'),
              ],
            ),

            SizedBox(height: 10),

            // Campaign Status and Action Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status: ${campaign['status']}',
                  style: TextStyle(
                    color: campaign['status'] == 'Active' ? Colors.green : Colors.red,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (campaign['status'] == 'Active') {
                      _pauseCampaign(index);
                    } else {
                      _resumeCampaign(index);
                    }
                  },
                  child: Text(campaign['status'] == 'Active' ? 'Pause' : 'Resume'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: campaign['status'] == 'Active' ? Colors.red : Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build metric cards
  Widget _buildMetricCard(String label, String value, Color color) {
    return Card(
      color: color.withOpacity(0.1),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

 // Helper functions to get total metrics
int _getTotalClicks() {
  return _campaigns.fold(0, (sum, campaign) => sum + (campaign['clicks'] as int));
}

int _getTotalImpressions() {
  return _campaigns.fold(0, (sum, campaign) => sum + (campaign['impressions'] as int));
}

double _getTotalSpend() {
  return _campaigns.fold(0.0, (sum, campaign) => sum + (campaign['spend'] as double));
}
}
