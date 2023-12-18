#include "../../includes/ft_stddef.h"
#include "../../includes/ft_string.h"
#include <stdio.h>

int main()
{
	printf("ft_strlen : \n");
	printf("%lu\n", ft_strlen("Salut"));
	printf("%lu\n", ft_strlen(""));
	printf("%lu\n", ft_strlen(NULL));
	return (0);
}
