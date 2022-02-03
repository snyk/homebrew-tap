class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.845.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.845.0/snyk-macos"
    sha256 "4e9b4b048e75e28b66db246a882d3f9cec2e6186be5bbe40c3eaa6619192aa90"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.845.0/snyk-linux"
    sha256 "c51243c7d9411e1316e493df25d69dab617c697b55858d9490d430c351f94c5c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
