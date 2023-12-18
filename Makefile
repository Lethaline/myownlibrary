.SILENT:
.PHONY: NAME re all fclean clean

NAME = myownlibrary.a

# Compilation

RM = rm -rf
CC = gcc
CFLAGS = -Wall -Werror -Wextra
GCOVFLAGS = --coverage

# Directories

SRCSDIR = srcs
INCSDIR = includes
TESTDIR = tests
OBJSDIR = objs
LOGSDIR = logs

# Sources

INC = \
	  ft_string.h \
	  ft_stddef.h \

SRC = \
	  ft_string/ft_strlen \

TEST = \
	   ft_string/ft_strlen_test \

# *************************************************************************** #

# Escape Codes

LOG_CLEAR = \033[2K
LOG_UP = \033[A
LOG_NOCOLOR = \033[0m
LOG_BLACK = \033[1;30m
LOG_RED = \033[1;31m
LOG_GREEN = \033[1;32m
LOG_YELLOW = \033[1;33m
LOG_BLUE = \033[1;34m
LOG_VIOLET = \033[1;35m
LOG_CYAN = \033[1;36m
LOG_WHITE = \033[1;37m

# *************************************************************************** #

SRCS = $(addprefix $(SRCSDIR)/, $(addsuffix .c, $(basename $(SRC))))
OBJS = $(addprefix $(OBJSDIR)/, $(addsuffix .o, $(basename $(SRC))))
OBJS_DIR = $(sort $(dir $(OBJS)))

INCS_DIR = $(addsuffix /, $(INCSDIR))
INCS = $(addprefix -I , $(INCS_DIR))

TESTFILES = $(addprefix $(TESTDIR)/, $(addsuffix .c, $(basename $(TEST))))

all : $(NAME)

$(NAME) : $(OBJS)
	echo "$(LOG_CLEAR)$(NAME)... $(LOG_CYAN)assembling... $(LOG_NOCOLOR)$(LOG_UP)"
	ar rcs $(NAME) $(OBJS)
	echo "$(LOG_CLEAR)$(NAME)... $(LOG_GREEN)compiled $(LOG_GREEN)✓$(LOG_NOCOLOR)"

clean :
	$(RM) $(OBJSDIR)

fclean : clean
	$(RM) $(NAME)

re : fclean all

$(OBJSDIR)/%.o: $(SRCSDIR)/%.c
	mkdir -p $(OBJSDIR) $(OBJS_DIR)
	echo "$(LOG_CLEAR)$(NAME)... $(LOG_YELLOW)$<$(LOG_NOCOLOR)$(LOG_UP)"
	$(CC) -c $(CFLAGS) $< -o $@

test : $(NAME)
	for test in $(TESTFILES); do \
		$(CC) $(CFLAGS) -o test $$test $<; \
		./test; \
		rm -rf test;\
	done

cov : 
## Get namefile at beginning
## Test file with -o name and object file with .c 
## Try it 
