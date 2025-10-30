enum OrderStatus {
  pending('AWAITING_ACCEPTANCE'),
  preparing('PROCESSING'),
  delivering('DELIVERING'),
  completed('COMPLETED'),
  canceled('CANCELLED'),
  all('');

  final String value;
  const OrderStatus(this.value);

  static OrderStatus fromJson(String? json) {
    switch (json) {
      case 'AWAITING_ACCEPTANCE':
        return OrderStatus.pending;
      case 'PROCESSING':
        return OrderStatus.preparing;
      case 'DELIVERING':
        return OrderStatus.delivering;
      case 'COMPLETED':
        return OrderStatus.completed;
      case 'CANCELLED':
        return OrderStatus.canceled;
      case '':
        return OrderStatus.all;
      default:
        return OrderStatus.all;
    }
  }
}

class OrderStatusMatching {
  OrderStatusMatching({
    this.orderStatus,
    this.value,
  });
  final String? value;
  final OrderStatus? orderStatus;

  OrderStatus checkOrderStatus() {
    switch (value) {
      case 'PROCESSING':
        return OrderStatus.preparing;
      case 'DELIVERING':
        return OrderStatus.delivering;
      case 'COMPLETED':
        return OrderStatus.completed;
      case 'CANCELLED':
        return OrderStatus.canceled;
      case 'AWAITING_ACCEPTANCE':
        return OrderStatus.pending;
      default:
        return OrderStatus.all;
    }
  }

  String orderStatusValue() {
    return orderStatus?.value ??
        'AWAITING_ACCEPTANCE'; // Default to Pennding if null
  }
}

extension OrderStatusX on OrderStatus {
  bool get pending => this == OrderStatus.pending;
  bool get complete => this == OrderStatus.completed;
  bool get processing => this == OrderStatus.preparing;
  bool get onTheWay => this == OrderStatus.delivering;
  bool get cancel => this == OrderStatus.canceled;
  bool get allOrder => this == OrderStatus.all;
}
