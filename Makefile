# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ktakamat <ktakamat@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/11/15 17:32:21 by ktakamat          #+#    #+#              #
#    Updated: 2025/11/17 16:01:31 by ktakamat         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS		=	ft_strlen.s ft_strcmp.s ft_strcpy.s ft_write.s ft_read.s ft_strdup.s
OBJS		=	$(SRCS:.s=.o)

NA			=	nasm
NA_FLAGS	=	-f elf64
FLAGS 		=	-Wall -Werror -Wextra
NAME		=	libasm.a
# TEST		=	TEST

%.o:			%.s
				$(NA) $(NA_FLAGS) $<

all:			$(NAME)

$(NAME):		$(OBJS)
				ar rcs $(NAME) $(OBJS)
				
clean:
				rm -rf $(OBJS)

fclean:			clean
				rm -rf $(NAME)
# 				$(TEST)

re:				fclean all

# test:			$(NAME)
# 				gcc $(FLAGS) -L. -lasm -o $(TEST) main.c
# 				./$(TEST) < Makefile
				
.PHONY:			all clean fclean re