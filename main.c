/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ktakamat <ktakamat@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/11/14 15:15:56 by ktakamat          #+#    #+#             */
/*   Updated: 2025/11/18 15:06:56 by ktakamat         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

#define RESET  "\x1B[0m"
#define RED  "\x1B[31m"
#define GREEN  "\x1B[32m"
#define YELLOW  "\x1B[33m"

size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dest, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(const char *s);

static int normalize_strcmp(int res)
{
	if (res > 0) return 1;
	if (res < 0) return -1;
	return 0;
}

void test_strlen()
{
	printf("%s--- Testing ft_strlen ---\n%s", YELLOW, RESET);
	char *strs[] = {"Hello World", "", "a", "1234567890", "a long string to test", NULL};
	int i = 0;
	while (strs[i])
	{
		size_t len1 = ft_strlen(strs[i]);
		size_t len2 = strlen(strs[i]);
		printf("String: \"%s\"\n", strs[i]);
		if (len1 == len2)
			printf("%s[OK]\n%s", GREEN, RESET);
		else
			printf("%s[KO]\n%s", RED, RESET);
		printf("------------------------\n");
		i++;
	}
}

void test_strcpy()
{
	printf("%s--- Testing ft_strcpy ---\n%s", YELLOW, RESET);
	char dest1[100];
	char dest2[100];
	char *srcs[] = {"Hello", "", "a longer source string", NULL};
	int i = 0;
	while (srcs[i])
	{
		memset(dest1, 0, 100);
		memset(dest2, 0, 100);

		ft_strcpy(dest1, srcs[i]);
		strcpy(dest2, srcs[i]);

		printf("Source:      \"%s\"\n", srcs[i]);
		if (strcmp(dest1, dest2) == 0)
			printf("%s[OK]\n%s", GREEN, RESET);
		else
			printf("%s[KO]\n%s", RED, RESET);
		printf("------------------------\n");
		i++;
	}
}

void test_strcmp()
{
	printf("%s--- Testing ft_strcmp ---\n%s", YELLOW, RESET);
	char *s1[] = {"hello", "hello", "abc", "abd", "", "a", NULL};
	char *s2[] = {"hello", "world", "abd", "abc", "", "b", NULL};
	int i = 0;
	while (s1[i])
	{
		int res1 = ft_strcmp(s1[i], s2[i]);
		int res2 = strcmp(s1[i], s2[i]);

		printf("s1: \"%s\", s2: \"%s\"\n", s1[i], s2[i]);

		if (normalize_strcmp(res1) == normalize_strcmp(res2))
			printf("%s[OK]\n%s", GREEN, RESET);
		else
			printf("%s[KO]\n%s", RED, RESET);
		printf("------------------------\n");
		i++;
	}
}

void test_write()
{
    printf("%s--- Testing ft_write ---\n%s", YELLOW, RESET);

    char *msg1 = "Hello from ft_write to stdout\n";
    ssize_t ret_ft, ret_std;

    printf("Writing to stdout (fd=1):\n");
    printf("ft_write: ");
    fflush(stdout);
    ret_ft = ft_write(1, msg1, strlen(msg1));
    printf("(return: %zd)\n", ret_ft);

    printf("write:    ");
    fflush(stdout);
    ret_std = write(1, msg1, strlen(msg1));
    printf("(return: %zd)\n", ret_std);
    printf(ret_ft == ret_std ? "%s[OK]\n%s" : "%s[KO]\n%s", GREEN, RESET);
    printf("------------------------\n");
}


void test_read()
{
    printf("%s--- Testing ft_read ---\n%s", YELLOW, RESET);
    char buffer_ft[100];
    char buffer_std[100];
    ssize_t ret_ft, ret_std;
    int fd;

    fd = open("test.txt", O_WRONLY | O_CREAT | O_TRUNC, 0644);
    write(fd, "This is a test file for ft_read.", 32);
    close(fd);

    printf("Reading from 'test.txt':\n");
    fd = open("test.txt", O_RDONLY);
    if (fd == -1) {
        perror("open");
        return;
    }
    memset(buffer_ft, 0, 100);
    ret_ft = ft_read(fd, buffer_ft, 32);
    printf("ft_read read %zd bytes: \"%s\"\n", ret_ft, buffer_ft);
    close(fd);

    fd = open("test.txt", O_RDONLY);
    memset(buffer_std, 0, 100);
    ret_std = read(fd, buffer_std, 32);
    printf("read    read %zd bytes: \"%s\"\n", ret_std, buffer_std);
    close(fd);

    printf(ret_ft == ret_std && strcmp(buffer_ft, buffer_std) == 0 ? "%s[OK]\n%s" : "%s[KO]\n%s", GREEN, RESET);
    remove("test.txt");
    printf("------------------------\n");
}


void test_strdup()
{
    printf("%s--- Testing ft_strdup ---\n%s", YELLOW, RESET);
    char *strs[] = {"duplicate me", "", "another test", NULL};
    int i = 0;
    while(strs[i])
    {
        char *dup_ft = ft_strdup(strs[i]);
        char *dup_std = strdup(strs[i]);

        printf("Original: \"%s\"\n", strs[i]);
        if (dup_ft && dup_std && strcmp(dup_ft, dup_std) == 0)
            printf("%s[OK]\n%s", GREEN, RESET);
        else
            printf("%s[KO]\n%s", RED, RESET);

        free(dup_ft);
        free(dup_std);
        printf("------------------------\n");
        i++;
    }
}


int main(void)
{
	test_strlen();
	test_strcpy();
	test_strcmp();
	test_write();
	test_read();
	test_strdup();
	return (0);
}