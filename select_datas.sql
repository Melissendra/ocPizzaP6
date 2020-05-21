SELECT public.user.id, public.user.lastname, public.user.firstname, public.restaurant.name, public.category.category_name FROM public.user
INNER JOIN public.restaurant
ON public.restaurant.id = public.user.id_restaurant
INNER JOIN public.category
ON public.category.id = public.user.id_category;

SELECT public.user.lastname, public.user.firstname, public.category.category_name FROM public.user
INNER JOIN public.category
ON public.category.id = public.user.id_category
WHERE public.category.category_name = 'client' OR public.category.category_name = 'manager';

SELECT public.user.lastname, public.user.firstname, public.address.street_number, public.address.street_name, public.address.city FROM public.address
INNER JOIN public.user
ON public.user.id = public.address.id_user;

SELECT public.user.lastname, public.user.firstname, public.order_state.preparation_state, public.restaurant.name FROM public.user
INNER JOIN public.address
ON public.address.id =  public.user.id
INNER JOIN public.order
ON public.order.id = public.address.id
INNER JOIN public.order_state
ON public.order_state.id = public.order.id
INNER JOIN public.restaurant
ON public.restaurant.id = public.user.id_restaurant;

