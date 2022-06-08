class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.947.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.947.0/snyk-macos"
    sha256 "85e2de251a98b67ec8f986d91358863ea6afd88dcc33de1e0068d98d21c4bfec"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.947.0/snyk-linux"
    sha256 "506ec980df01b3104fc7b23d3215fea9edfcc685528e38984a620f5760139be7"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
