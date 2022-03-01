class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.859.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.859.0/snyk-macos"
    sha256 "15b44b295efa8e7df0955d965a6ac11105f2ff5de413d7c992b150bc8670369c"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.859.0/snyk-linux"
    sha256 "10c48748b57d7fa9bb99f0f1eec9ee092ff6dd8f8d7824feed42e6f47f794460"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
