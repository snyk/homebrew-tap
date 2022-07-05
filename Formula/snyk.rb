class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.963.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.963.0/snyk-macos"
    sha256 "7055e0472790eb8e86ff294dc17f495f664f277c83f5cb84fe7502f4e270fa42"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.963.0/snyk-linux"
    sha256 "10b745c66b3cba9f43729d2495ba2af5658fa597dac7a7ae1ee1c26d1b3d0c76"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
