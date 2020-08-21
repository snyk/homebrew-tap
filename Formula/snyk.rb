class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.381.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.381.1/snyk-macos"
    sha256 "ab675fe95c6c8cd83b361121445f760b5e00b872a021bee0d5b7441f67e904bb"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.381.1/snyk-linux"
    sha256 "76b4863d3314274dcca26cf220c08c84d67b9491c31491155f21a17a7285b9e3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
