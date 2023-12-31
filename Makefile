CC = cc
CFLAGS = -Wall -Werror -Wextra 

NAME = mini_shell

SRCS =	main.c						\
		parse/parse.c				\
		parse/infile_finder.c		\
		parse/cmd_finder.c			\
		parse/outfile_finder.c		\
		parse/here_doc/here_doc.c	\
		parse/here_doc/gnl.c		\
		parse/here_doc/gnl_utils.c	\
		pipex/childs.c				\
		pipex/forks.c				\
		pipex/pipex.c				\
		pipex/rutes.c				\
		pipex/one_child.c

		
OBJS = $(SRCS:.c=.o)

all: $(NAME) 

$(NAME): $(OBJS) libft/libft.a
	$(CC) $(OBJS) -o $(NAME) -Llibft/ -lft -lreadline

libft/libft.a:
	make -C libft/

%.o: %.c
	$(CC) $(CFLAGS) -Imlx -c $< -o $@

clean:
	rm -rf $(OBJS)
	make -C libft/ clean

fclean: clean
	rm -rf $(NAME)
	make -C libft/ fclean

re: fclean $(NAME)
	make -C libft/ re

.PHONY: clean fclean re

del:
	@./a.out