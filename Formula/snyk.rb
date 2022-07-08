class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.965.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.965.0/snyk-macos"
    sha256 "de30cdf5c0938ced7ed5c955093222cd943b524b83ce9a54980cc8bd92e1772f"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.965.0/snyk-linux"
    sha256 "b4708d693266f5e6af00996f18733880747e46db348e0c0e5accea90a9269c73"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
