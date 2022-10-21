class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1038.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1038.0/snyk-macos"
    sha256 "d6748a18b50c222ec26f1affe151e8085f1ad4d379b9480035667aef900e4dfb"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1038.0/snyk-linux"
    sha256 "56dbd2fd38c1c030d11196745b81086e44e200022eb2f07259662c42120e6197"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
