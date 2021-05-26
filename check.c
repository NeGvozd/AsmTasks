// property:
//   text ends with a capital Latin letter, which is unique
#include <stdio.h>
#include <ctype.h>
#include <assert.h>

int str_len(const char* s)
{
  int count = 0;
  for (; *s != '\0'; ++s)
    count ++;

  return count;
}

char delNew(char* st)
{
  char c = *st;
  char *d = st+1;
  char *s = st+1;
  while(*(d-1))
  {
    if (s != st)
      *d++=*s;
    s++;
  }
}

void delete_char(char* s, const int pos)
{
  for (int i = pos; i < str_len(s); ++i)
    s[i] = s[i+1];
}

static int is_balance (const char* s)
{
  int n = 0;
  for (; *s != '\0'; ++s)
    if (*s >= 'A' && *s <= 'Z') {
      n++;
    }
    else if (*s >= 'a' && *s <= 'z')
      n--;

  return n;
}

void line_changing(char* s)
{
  char c = '\0';
  int len = str_len(s);

  for (int i = 0; i < len; ++i)
  {

    int a1 = 0;
    if (i > 0 && s[i] != *s) {
      //delete_char(s, i);
      a1 = i;
    }
    else a1 = i;
    if (a1 != 0 && a1 != i)
    {
      s[a1] = s[i];
    }
    
    if (s[i] <= 'z' && s[i] >= 'Z')
      s[i] = s[i] - 'a' + 'A';
  }
}

char check_property (char* s)
{
  char res = *s;

  if (is_balance(s) == 0)
    line_changing(s);

  return *s;
}