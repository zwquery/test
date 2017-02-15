# This extremely basic script uninstalls all products from Apple on a Windows computer.
# Of course, you can fork it and adapt filter part (for example)

$products = gwmi -class win32_product -filter "Vendor like 'Apple%'"
if ($products) {
    foreach ($product in $products) {
        $product.Uninstall()
        # Uninstall all those sh!ts
    }
}