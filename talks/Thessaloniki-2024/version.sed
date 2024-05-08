# Edit VERSION.txt
#
# Fixed-width for Version information.
1s/^Version\(.*$\)/Version: \`\1\`/

# Fixed-width Author email information.
4s/</<\`/
4s/>/\`>/

# Remove empty lines
/^[[:space:]]*$/d

# Vertical rules at start and end of each line.
# s/^.*$/|&|/

# Insert header
1i| | |\n|----|--------------------------------------------------|

5s/^.$/|Comment:|&/
2,3s/^.*$/|&|/

# Add pipes for date and author
2,3s/:/:|/

# Delete line describing commit
/^commit.*$/d

# Delete major underlining
/^=*$/d


# Introduce summary
5s/^.*$/|Summary:| & |/
6,$s/^.*$/|| & |/
# Add blank lines at end
$s/$/\n\n/
