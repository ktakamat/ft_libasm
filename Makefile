# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ktakamat <ktakamat@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/11/15 17:32:21 by ktakamat          #+#    #+#              #
#    Updated: 2025/11/18 14:40:09 by ktakamat         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS		=	ft_strlen.s ft_strcmp.s ft_strcpy.s ft_write.s ft_read.s ft_strdup.s
OBJS		=	$(SRCS:.s=.o)

NA			=	nasm
NA_FLAGS	=	-f elf64
CFLAGS		=	-Wall -Werror -Wextra -no-pie
NAME		=	libasm.a
TESTER		=	test_libasm
MAIN_SRC	=	main.c
CC			=	gcc


all:			$(NAME)

$(NAME):		$(OBJS)
				ar rcs $(NAME) $(OBJS)

%.o:			%.s
				$(NA) $(NA_FLAGS) $< -o $@

test:			re_test

$(TESTER):		$(NAME)
				$(CC) $(CFLAGS) $(MAIN_SRC) -o $(TESTER) -L. -lasm

run_test:		$(TESTER)
				./$(TESTER)

re_test:		re $(TESTER) run_test
				
clean:
				rm -rf $(OBJS)

fclean:			clean
				rm -rf $(NAME) $(TESTER)

re:				fclean all

.PHONY:			all clean fclean re test run_test re_test
