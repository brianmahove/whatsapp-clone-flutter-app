import 'package:flutter/material.dart';

class SelectiveBreedingTutorialScreen extends StatelessWidget {
  const SelectiveBreedingTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selective Breeding of Plants')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Understanding Selective Breeding of Plants',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Have you ever wondered how we got the diverse and delicious fruits and vegetables we enjoy today? Many of them are a result of a fascinating process called selective breeding. Let\'s explore what this involves and why it\'s important.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(context, 'What is Selective Breeding?'),
            const SizedBox(height: 8.0),
            const Text(
              'Every living organism has a unique code called a genome, which determines its traits. Selective breeding is a technique used for thousands of years to enhance desirable traits in plants (and animals) without directly altering their genetic material in a lab.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Instead, it involves carefully choosing parent plants with the characteristics we want and allowing them to reproduce. Their offspring are more likely to inherit these desired traits. This process is repeated over generations, gradually leading to new varieties with improved qualities.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(context, 'The Process in Action'),
            const SizedBox(height: 8.0),
            const Text(
              'Imagine you want to grow plants with larger fruits. You would select the plants in your garden that produce the biggest fruits and allow them to pollinate each other (or you might manually pollinate them).',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'The seeds from these large-fruited parents are then planted. Among the new generation, you would again select the plants with the largest fruits and repeat the breeding process. Over several generations, this consistent selection can lead to a new variety of the plant that consistently produces larger fruits.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(
              context,
              'Selective Breeding vs. Genetic Engineering',
            ),
            const SizedBox(height: 8.0),
            const Text(
              'It\'s important to distinguish selective breeding from genetic engineering (which produces Genetically Modified Organisms or GMOs). While both aim to improve plant traits, they are very different:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '- Selective breeding relies on natural reproduction and the selection of existing genes within a species over many generations.',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '- Genetic engineering involves directly manipulating the genes of an organism in a laboratory, often introducing genes from other species. This is a much more recent and direct method.',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(context, 'Examples of Selectively Bred Plants'),
            const SizedBox(height: 8.0),
            const Text(
              'Many common vegetables and fruits are products of centuries of selective breeding:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '- Broccoli, Kale, Cabbage, Cauliflower, Brussels Sprouts: All these diverse vegetables originated from a single wild cabbage plant (Brassica Oleracea) through selective breeding for different traits (suppressed flowers for broccoli, larger leaves for kale, etc.).',
              style: TextStyle(fontSize: 16.0),
            ),

            const SizedBox(height: 8.0),
            Image(image: AssetImage('assets/selective_breeding.png')),
            const SizedBox(height: 8.0),
            const Text(
              '- Corn (Maize): Modern corn is vastly different from its ancestor, teosinte, a type of grass with small, sparse kernels. Through generations of selecting and planting larger, tastier kernels, humans gradually transformed it into the corn we know today.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '- Watermelon: Ancient watermelons were small, bitter, and hard to open. Selective breeding over centuries has resulted in the large, sweet, and juicy fruit we enjoy.',

              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(context, 'Safety of Selectively Bred Plants'),
            const SizedBox(height: 8.0),
            const Text(
              'Plants produced through selective breeding are generally considered safe to eat. Humans have been consuming them for thousands of years. This process primarily works by enhancing naturally occurring variations within a species.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Breeders select for traits like better taste, increased yield, or disease resistance, but they are not introducing foreign substances or drastically altering the plant\'s fundamental genetic makeup in a lab setting.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            _buildSectionTitle(context, 'In Conclusion'),
            const SizedBox(height: 8.0),
            const Text(
              'Selective breeding is a time-honored and essential agricultural practice that has shaped the food we eat. By understanding this process, we can appreciate the ingenuity of early farmers and the continuous efforts to improve our crops naturally and safely.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.green.shade700,
      ),
    );
  }
}
