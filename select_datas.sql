SELECT public.user.id, public.user.lastname, public.user.firstname, public.restaurant.name, public.category.category_name FROM public.user
INNER JOIN public.restaurant
ON public.restaurant.id = public.user.id_restaurant
INNER JOIN public.category
ON public.category.id = public.user.id_category;

SELECT public.user.lastname, public.user.firstname, public.category.category_name FROM public.user
INNER JOIN public.category
ON public.category.id = public.user.id_category
WHERE public.category.category_name = 'client' OR public.category.category_name = 'manager';

SELECT public.user.lastname, public.user.firstname, public.order_state.preparation_state, public.restaurant.name FROM public.user
INNER JOIN public.address
ON public.address.id_user =  public.user.id
INNER JOIN public.order
ON public.order.id = public.address.id
INNER JOIN public.order_state
ON public.order_state.id = public.order.id
INNER JOIN public.restaurant
ON public.restaurant.id = public.order.id_restaurant;

SELECT public.product.product_name, public.basket_line.basket_date, public.basket_line.product_amount, public.basket_line.price, public.user.lastname, public.user.firstname FROM public.product
INNER JOIN public.basket_line
ON public.basket_line.id_product = public.product.id
INNER JOIN public.order
ON public.order.id = public.basket_line.id_order
INNER JOIN public.address
ON public.address.id = public.order.id_address
INNER JOIN public.user
ON public.user.id = public.address.id_user;

