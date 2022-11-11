class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1057.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1057.0/snyk-macos"
    sha256 "c3b68c8e9f73d5fc64baf9cc7b6998cd81d69955607c4aa467e946eadf7f3105"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1057.0/snyk-linux"
    sha256 "657f1504da4a509f459efcaef5fec99904ec32403d87db262d482a2a7dba43f9"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
