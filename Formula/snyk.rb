class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.921.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.921.0/snyk-macos"
    sha256 "20b9cd8474ec0fc01fcb53e3ea9e07ea037175045f3757be766e0cae00df9737"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.921.0/snyk-linux"
    sha256 "aae6ea2952a2980430f2c1f7a3bd582042ebf88784b6e3d3a6f0e2c686abe58e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
