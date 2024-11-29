import '/exports.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Доступ к TabProvider для получения текущего индекса
    final selectedIndex = context.watch<BottomNavBarIndexProvider>().selectedIndex;
    ThemeData theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ClipRRect( // Используем ClipRRect для обрезки
        borderRadius: BorderRadius.all(Radius.circular(100.0)), // Уголки
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white, // Цвет фона
            /* boxShadow: [
              BoxShadow(
                color: theme.colorScheme.onTertiaryFixed.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ], */
            borderRadius: BorderRadius.all(
              Radius.circular(100.0),
            ),
          ),
          child: BottomNavigationBar(
            items: _buildBottomNavigationBarItems(context),
            currentIndex: selectedIndex, // Получаем текущий индекс из Provider
            onTap: (index) {
              context.read<BottomNavBarIndexProvider>().selectTab(index); // Обновляем индекс через Provider
            },
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            backgroundColor: theme.colorScheme.secondaryContainer, // Делаем фон прозрачным, чтобы не было конфликта с родительским контейнером
            elevation: 0,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems(BuildContext context) {
    final selectedIndex = context.watch<BottomNavBarIndexProvider>().selectedIndex;

    return [
      BottomNavigationBarItem(
        icon: CustomIconWithRect(icon: Icons.self_improvement, isSelected: selectedIndex == 0),
        label: 'Что-то там',
      ),
      BottomNavigationBarItem(
        icon: CustomIconWithRect(icon: Icons.currency_ruble, isSelected: selectedIndex == 1),
        label: 'Это рубль',
      ),
      BottomNavigationBarItem(
        icon: CustomIconWithRect(icon: Icons.euro, isSelected: selectedIndex == 2),
        label: 'Ещё что',
      ),
    ];
  }
}
