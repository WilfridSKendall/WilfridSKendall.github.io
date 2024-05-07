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
1s/^Version.*$/|`git` repository information.\n|------------------------------------------------------|\n| & |/

# Delete line describing commit
/^commit.*$/d

# Delete major underlining
/^=*$/d

# Add tabulation for other lines
2,$s/^.*$/| & |/

# Add end of table followed by blank line at end
$s/$/|------------------------------------------------------|\n\n/
