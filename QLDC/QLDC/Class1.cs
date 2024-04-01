public class CartItem
{
    public string ProductId { get; set; }
    public string ProductName { get; set; }
    public string ProductPrice { get; set; }

    public CartItem(string productId, string productName, string productPrice)
    {
        ProductId = productId;
        ProductName = productName;
        ProductPrice = productPrice;
    }
}
