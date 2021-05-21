// property:
//   text ends with a capital Latin letter, which is unique

#include <ctype.h>
#include <assert.h>

static char last_of (const char* s)
{
  assert(s);

  char c = '\0';
  for ( ; *s != '\0'; ++s)
    c = *s;

  return c;
}

static int count (const char* s, char c)
{
  assert(s);

  int n = 0;
  for ( ; *s != '\0'; ++s)
    if (*s == c) ++n;

  return n;
}

int check_property (const char* s)
{
  char c = last_of(s);

  if (!isupper(c))
    return 0;

  return count(s, c) == 1;
}
