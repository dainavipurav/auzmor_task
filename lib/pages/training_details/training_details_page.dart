import 'package:flutter/material.dart';
import 'package:my_trainings/components/page_layout.dart';
import 'package:my_trainings/core/theme/colors.dart';
import 'package:my_trainings/models/training_model.dart';

class TrainingDetailsPage extends StatelessWidget {
  final TrainingModel training;
  const TrainingDetailsPage({super.key, required this.training});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 260,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  image: DecorationImage(
                    image: AssetImage(
                      training.image ?? '',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                _buildDetailTile(
                  icon: Icons.title,
                  label: "Title",
                  value: training.title ?? 'N/A',
                ),
                _buildDetailTile(
                  icon: Icons.calendar_today,
                  label: "Date",
                  value: training.date ?? 'N/A',
                ),
                _buildDetailTile(
                  icon: Icons.access_time,
                  label: "Time",
                  value: training.time ?? 'N/A',
                ),
                _buildDetailTile(
                  icon: Icons.location_on,
                  label: "Address",
                  value: training.address ?? 'N/A',
                ),
                _buildDetailTile(
                  icon: Icons.trending_up,
                  label: "Popularity Status",
                  value: training.popularityStatus ?? 'N/A',
                ),
                _buildDetailTile(
                  icon: Icons.star,
                  label: "Rating",
                  value: training.rating?.toStringAsFixed(1) ?? 'N/A',
                ),
                const Divider(),
                _buildDetailTile(
                  icon: Icons.person,
                  label: "Trainer Name",
                  value: training.trainer?.name ?? 'N/A',
                ),
                _buildDetailTile(
                  icon: Icons.work,
                  label: "Trainer Designation",
                  value: training.trainer?.designation ?? 'N/A',
                ),
                const Divider(),
                _buildDetailTile(
                  icon: Icons.attach_money,
                  label: "Base Amount",
                  value: "\$ ${training.baseAmount?.toString() ?? 'N/A'}",
                ),
                _buildDetailTile(
                  icon: Icons.discount,
                  label: "Discount Amount",
                  value: "\$ ${training.discountAmount?.toString() ?? 'N/A'}",
                ),
                _buildDetailTile(
                  icon: Icons.monetization_on,
                  label: "Final Amount",
                  value: "\$ ${training.finalAmount?.toString() ?? 'N/A'}",
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        spacing: 12,
        children: [
          Icon(icon, color: Colors.redAccent, size: 24),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.outlinedButtonTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
