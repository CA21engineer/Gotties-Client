# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
fail("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500

# Don't let testing shortcuts get into master by accident
fail("fdescribe left in tests") if `grep -r fdescribe specs/ `.length > 1
fail("fit left in tests") if `grep -r fit specs/ `.length > 1

flutter_lint.only_modified_files = true
flutter_lint.report_path = "flutter_analyze_report.txt"
flutter_lint.lint

# Create inline comments to report checkstyle issues which happen only on modified files
checkstyle_reports.tap do |plugin|
  plugin.inline_comment=true

  # Report lint warnings
  Dir.glob("**/checkstyle.xml").each do |xml|
    plugin.report(xml, modified_files_only: true)
  end
end

# LGTM
if status_report[:errors].length.zero? && status_report[:warnings].length.zero?
    markdown("LGTM :tada:")
    lgtm.check_lgtm
end